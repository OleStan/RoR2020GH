document.addEventListener("click", function(e) {
    const target_element = e.target;
    if (target_element.className=="change_icon" || target_element.className=="change_icon_box")
        switcher_media(target_element);
});
var  button1 = document.getElementById("1");
var  button2 = document.getElementById("2");
var  button3 = document.getElementById("3");
var  button4 = document.getElementById("4");
var  button5 = document.getElementById("5");
var  button6 = document.getElementById("6");
var  button7 = document.getElementById("7");



/*-----hide click----------------------------------------------*/
button1.addEventListener("click",function (event) {
    console.log("click");

});


/*-----add click---------------------------------------------*/
/*
button_add.onclick = function () {
    const li = document.createElement("li");
    ul.appendChild(li);
    const paste = document.getElementById("in_").value;
    li.innerHTML = paste;
    console.log(input.value);

    input.value= " ";
    i++;
};



function put_chose() {
    alert( 'Всем привет!' );
}*/