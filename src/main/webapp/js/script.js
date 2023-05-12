const cheeseTab = document.getElementById("cheese-and-sauce-tab");
const cheeseTabPane = document.getElementById("cheese-and-sauce-tab-pane");
const sizeTab = document.getElementById("size-and-crust-tab");
const sizeTabPane = document.getElementById("size-and-crust-tab-pane");
const toppingsTab = document.getElementById("toppings-tab");
const toppingsTabPane = document.getElementById("toppings-tab-pane");
const checkoutTab = document.getElementById("checkout-tab");
const checkoutTabPane = document.getElementById("checkout-tab-pane");
const submitOrderBtn = document.getElementById("submit-order-btn");
const forms = document.getElementsByTagName("form");

document.getElementById("size-and-crust-next-step-btn").onclick = function() {

// switch to the "Cheese and Sauce" tab
cheeseTab.classList.add("active");
cheeseTab.classList.add("show");
cheeseTab.setAttribute("aria-selected", "true");
cheeseTabPane.classList.add("active");
cheeseTabPane.classList.add("show");
cheeseTabPane.setAttribute("aria-selected", "true");

// remove the active class from the "Size and Crust" tab
sizeTab.classList.remove("active");
sizeTab.classList.remove("show");
sizeTab.setAttribute("aria-selected", "false");
sizeTabPane.classList.remove("active");
sizeTabPane.classList.remove("show");
sizeTabPane.setAttribute("aria-selected", "false");
};

document.getElementById("cheese-and-sauce-next-step-btn").onclick = function() {

// switch to the "Toppings" tab
toppingsTab.classList.add("active");
toppingsTab.classList.add("show");
toppingsTab.setAttribute("aria-selected", "true");
toppingsTabPane.classList.add("active");
toppingsTabPane.classList.add("show");
toppingsTabPane.setAttribute("aria-selected", "true");

// remove the active class from the "Cheese and Sauce" tab
cheeseTab.classList.remove("active");
cheeseTab.classList.remove("show");
cheeseTab.setAttribute("aria-selected", "false");
cheeseTabPane.classList.remove("active");
cheeseTabPane.classList.remove("show");
cheeseTabPane.setAttribute("aria-selected", "false");
};

document.getElementById("cheese-and-sauce-previous-step-btn").onclick = function() {

// switch to the "Size and Crust" tab
sizeTab.classList.add("active");
sizeTab.classList.add("show");
sizeTab.setAttribute("aria-selected", "true");
sizeTabPane.classList.add("active");
sizeTabPane.classList.add("show");
sizeTabPane.setAttribute("aria-selected", "true");

// remove the active class from the "Cheese and Sauce" tab
cheeseTab.classList.remove("active");
cheeseTab.classList.remove("show");
cheeseTab.setAttribute("aria-selected", "false");
cheeseTabPane.classList.remove("active");
cheeseTabPane.classList.remove("show");
cheeseTabPane.setAttribute("aria-selected", "false");
};

document.getElementById("toppings-previous-step-btn").onclick = function() {

// switch to the "Cheese and Sauce" tab
cheeseTab.classList.add("active");
cheeseTab.classList.add("show");
cheeseTab.setAttribute("aria-selected", "true");
cheeseTabPane.classList.add("active");
cheeseTabPane.classList.add("show");
cheeseTabPane.setAttribute("aria-selected", "true");

// remove the active class from the "Toppings" tab
toppingsTab.classList.remove("active");
toppingsTab.classList.remove("show");
toppingsTab.setAttribute("aria-selected", "false");
toppingsTabPane.classList.remove("active");
toppingsTabPane.classList.remove("show");
toppingsTabPane.setAttribute("aria-selected", "false");
};

document.getElementById("checkout-btn").onclick = function() {
//Switch to the "Checkout" tab
checkoutTab.classList.add("active");
checkoutTab.classList.add("show");
checkoutTab.setAttribute("aria-selected", "true");
checkoutTabPane.classList.add("active");
checkoutTabPane.classList.add("show");
checkoutTabPane.setAttribute("aria-selected", "true");
// remove the active class from the "Toppings" tab
toppingsTab.classList.remove("active");
toppingsTab.classList.remove("show");
toppingsTab.setAttribute("aria-selected", "false");
toppingsTabPane.classList.remove("active");
toppingsTabPane.classList.remove("show");
toppingsTabPane.setAttribute("aria-selected", "false");
};

document.getElementById("checkout-previous-step-btn").onclick = function() {
//Switch to the "Toppings" tab
toppingsTab.classList.add("active");
toppingsTab.classList.add("show");
toppingsTab.setAttribute("aria-selected", "true");
toppingsTabPane.classList.add("active");
toppingsTabPane.classList.add("show");
toppingsTabPane.setAttribute("aria-selected", "true");
// remove the active class from the "Checkout" tab
checkoutTab.classList.remove("active");
checkoutTab.classList.remove("show");
checkoutTab.setAttribute("aria-selected", "false");
checkoutTabPane.classList.remove("active");
checkoutTabPane.classList.remove("show");
checkoutTabPane.setAttribute("aria-selected", "false");
};

//Submit all forms on the page
submitOrderBtn.addEventListener("click", function() {
	const formData = new FormData();

	for (let i = 0; i < forms.length; i++) {
		const form = forms[i];
		for (let j = 0; j < form.elements.length; j++) {
			const element = form.elements[j];
			if (shouldIncludeElement(element)) {
				formData.append(element.name, element.value);
			}
		}
	}
	fetch('/pizza-order', {
		method: 'POST',
		body: formData
	})
		.then(function(response) {
			console.log(response.text());
		})
		.catch(function(error) {
			console.error(error);
		});
});

function shouldIncludeElement(element) {
	if (element.type === 'radio' || element.type === 'checkbox') {
		return element.checked;
	} else if (element.tagName === 'SELECT') {
		return element.options[element.selectedIndex].value !== '';
	} else if (element.tagName === 'INPUT') {
		return element.type !== 'button' && element.type !== 'submit';
	} else {
		return false;
	}
}