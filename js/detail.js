document.addEventListener('DOMContentLoaded',()=>{
    const container = document.getElementById("detailContainer");
    const params = new URLSearchParams(window.location.search);
    const id = Number(params.get("id"));

    fetch('js/produits.json')
    .then(reponse => reponse.json())
    .then(data => {
        const item = data[id];
        
         const htmlContent = `
        
                <br><br>
                <h2>${item.name}</h2>
                <div class="detail-frame">
                    <img src=${item.image} alt=${item.name} loading = "lazy">
                </div>
                <p class="prix">${item.price}$</p>
                <br>
                <a class="btn" href="#" onclick="addToCart(${item.id}); return false">Add to cart</a>
                <br>
                <p class="desc"> ${item.descr}</p>
                <br><br>
                <br><br>
            
`
        container.innerHTML = htmlContent;

        }
    );

}
);
