from fastapi import FastAPI
from fastapi.staticfiles import StaticFiles
from database import get_connection
from passlib.context import CryptContext
from pydantic import BaseModel, EmailStr
from fastapi.middleware.cors import CORSMiddleware


pwd = CryptContext(schemes=["bcrypt"], deprecated="auto")

app = FastAPI()
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)


class RegisterRequest(BaseModel):
    name: str
    email: EmailStr
    password: str

class LoginRequest(BaseModel):
    email: EmailStr
    password: str

class PurchaseRequest(BaseModel):
    product_id: int
    quantity: int


@app.post("/api/register")
def register(request: RegisterRequest):
    conn = get_connection()
    cursor = conn.cursor()
    
    sql = "SELECT id FROM users WHERE email = %s"
    cursor.execute(sql, (request.email,))
    existingUser = cursor.fetchone()

    if existingUser:
        cursor.close()
        conn.close()
        return {"error": "Already registered"}
        
    hashed_pwd = pwd.hash(request.password)


    cursor.execute(
        "INSERT INTO users (name, email, password) VALUES (%s, %s, %s)",
        (request.name, request.email, hashed_pwd)
    )

    conn.commit()
    cursor.close()
    conn.close()

    return {"message": "Registered successfully"}


@app.post("/api/login")
def login(request: LoginRequest):
    conn = get_connection()
    cursor = conn.cursor()
    
    sql = "SELECT id, name, password FROM users WHERE email = %s"
    cursor.execute(sql, (request.email,))
    user = cursor.fetchone()

    cursor.close()
    conn.close()

    if not user or not pwd.verify(request.password, user[2]):
        return {"error": "Invalid email or password"}

    return {
        "message": "Login successful",
        "user": {"id": user[0], "name": user[1], "email": request.email}
    }

@app.get("/api/products")
def get_products():
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)

    cursor.execute("SELECT * FROM products")
    products = cursor.fetchall()

    cursor.close()
    conn.close()

    return products


@app.post("/api/purchase")
def purchase(request: PurchaseRequest):
    conn = get_connection()
    cursor = conn.cursor()

    cursor.execute("SELECT quantity FROM products WHERE id = %s", (request.product_id,))
    result = cursor.fetchone()

    if not result or result[0] < request.quantity:
        cursor.close()
        conn.close()
        return {"error": "Not enough stock"}

    cursor.execute(
        "UPDATE products SET quantity = quantity - %s WHERE id = %s",
        (request.quantity, request.product_id)
    )
    conn.commit()

    cursor.close()
    conn.close()

    return {"message": "Purchase successful"}


app.mount("/", StaticFiles(directory="../", html=True), name="static")