const API_URL = 'http://localhost:8000';

document.getElementById('auth-form').addEventListener('submit', async (event) => {
    event.preventDefault();

    // Gets which submit button was clicked ("Login" or "Signup")
    const action = event.submitter ? event.submitter.value : '';
    const email = document.getElementById("mail").value;
    const password = document.getElementById("password").value;

    if (action === 'Signup') {
        const name = email.split('@')[0];

        const response = await fetch(`${API_URL}/api/register`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ name, email, password })
        });

        const data = await response.json();
        alert(data.error || data.message || "You created your account");
    }

    if (action === 'Login') {
        const response = await fetch(`${API_URL}/api/login`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ email, password })
        });

        const data = await response.json();
        if (data.error) {
            alert(data.error);
        } else {
            localStorage.setItem('user', JSON.stringify(data.user));
            alert('Logged in!');
            window.location.href = 'index.html';
        }
    }
});

function logout() {
    localStorage.removeItem('user');
    window.location.href = 'login.html';
}