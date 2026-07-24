let products = [];

async function loadProducts() {
  const response = await fetch('js/produits.json');
  products = await response.json();
  renderCart(); 
}

loadProducts();

const getCart = () => {
  const raw = localStorage.getItem("cart");
  return raw ? JSON.parse(raw) : [];
};

const saveCart = (cart) => {
  localStorage.setItem("cart", JSON.stringify(cart));
};

const addToCart = (productId) => {
  const cart = getCart();
  const existing = cart.find(item => item.id === productId);

  if (!existing) {
    const product = products.find(p => p.id === productId);
    if (!product) {
      console.error("No product found with id", productId);
      return;
    }
    alert("You added " + product.name + " to cart");
    cart.push({ id: productId, quantity: 1 });
    saveCart(cart);
  }

  if (document.getElementById("cart-items")) {
    renderCart();
  }
};

const changeQuantity = () => {
  const tableau = document.querySelectorAll('.quantity');
  tableau.forEach((element) => {
    const decreaseBtn = element.querySelector('.decrease-btn');
    const increaseBtn = element.querySelector('.increase-btn');
    const qty = element.querySelector('.value');
    const id = parseInt(element.getAttribute('product-id'));
    const product = products.find(p => p.id === id);

    decreaseBtn.addEventListener('click', () => {
      let quantityValue = parseInt(qty.textContent);
      let newPrice = parseInt(document.getElementById("totalPrice").textContent);

      if (quantityValue > 1) {
        quantityValue--;
        qty.innerText = quantityValue;
        newPrice -= product.price;
        document.getElementById("totalPrice").innerHTML = newPrice;
        updateCartQuantity(id, quantityValue);
      }
    });

    increaseBtn.addEventListener('click', () => {
      let quantityValue = parseInt(qty.textContent);
      let newPrice = parseInt(document.getElementById("totalPrice").textContent);
      let stock = product.stock;
      if (quantityValue < stock){
        quantityValue++;
        qty.innerText = quantityValue;
        newPrice += product.price;
        document.getElementById("totalPrice").innerHTML = newPrice;
        updateCartQuantity(id, quantityValue);
      }
    });
  });
};

const updateCartQuantity = (productId, newQuantity) => {
  const cart = getCart();
  const item = cart.find(cartItem => cartItem.id === productId);
  if (item) {
    item.quantity = newQuantity;
    saveCart(cart);
  }
};

const renderCart = () => {
  const container = document.getElementById("cart-items");
  if (!container) return;

  const cart = getCart();
  const footer = document.querySelector('footer');

  if (cart.length === 0) {
    container.innerHTML = "<p>Your cart is empty.</p>";
    document.getElementById("totalPrice").innerHTML = 0;
    footer.style.display = 'none';
    return;
  }

  footer.style.display = '';
  let allContent = '';
  let total = 0;

  cart.forEach((cartItem) => {
    const myItem = products.find(p => p.id === cartItem.id);
    console.log(myItem.stock)
    if (!myItem) return;
    total += myItem.price * cartItem.quantity;
    allContent += `
      <article>
        <h2>${myItem.name}</h2>
        <div class="frame">
          <img src="${myItem.image}" alt="${myItem.name}" loading="lazy">
        </div>
        <p class="artist"><strong>Artist: ${myItem.artist}</strong></p>
        <p>${myItem.price}$</p>
        <p>${myItem.stock} left</p>
        <a href="#" class="btn" onclick="remove(${myItem.id});return false">Remove from cart</a>
        <div class="quantity" product-id="${myItem.id}">
          <button class="quantity-btn decrease-btn">-</button>
          <span class="value">${cartItem.quantity}</span>
          <button class="quantity-btn increase-btn">+</button>
        </div>
      </article>
    `;
  });

  container.innerHTML = allContent;
  document.getElementById("totalPrice").innerHTML = total;

  changeQuantity();
};

const remove = (productId) => {
  const cart = getCart().filter(item => item.id !== productId);
  saveCart(cart);
  renderCart();
};

const emptyCart = () => {
  localStorage.removeItem("cart");
  renderCart();
};