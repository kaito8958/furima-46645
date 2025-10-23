const price = () => {
  const priceInput = document.getElementById("item-price");
  if (!priceInput) return; 

  priceInput.addEventListener("input", () => {
    const price = priceInput.value;
    const tax = Math.floor(price * 0.1);
    const profit = price - tax;

    document.getElementById("add-tax-price").textContent = tax;
    document.getElementById("profit").textContent = profit;
  });
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);
