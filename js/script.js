document.addEventListener("DOMContentLoaded", () => {
  const container = document.getElementById("allItems");
    let allContent = '';

fetch('js/produits.json') 
    .then(reponse => reponse.json())
    .then(data => {
      data.forEach((item) => {
      const htmlContent = `
        
        <article>

                <h2>${item.name}</h2>
                <div class="frame">
                    <img src=${item.image} alt=${item.name} loading = "lazy">
                </div>
                <p class="artist"><strong>Artist: ${item.artist}</strong></p>

                <p> ${item.price}$</p>
            
                <a class="btn" href="detail.html?id=${item.id}" target="_blank">See product</a>
                <a class="btn" href="#" onclick="addToCart(${item.id}); return false">Add to cart</a>

        </article>
        `
    allContent += htmlContent;
    });



    container.innerHTML = allContent;
    })
    .catch(error => console.error('Error:', error));
});




    