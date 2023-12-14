
function openAsistenDosen() {
    window.location.href = '/AsistenDosen';
}

function openMatakuliah() {
    window.location.href = '/Matakuliah';
}

function openProfileDosen(){
    window.location.href = "/profil-dosen"
}

function showPopup() {
    document.getElementById('popup').style.display = 'block';
    document.getElementById('overlay').style.display = 'block';
}

function hidePopup() {
    document.getElementById('popup').style.display = 'none';
    document.getElementById('overlay').style.display = 'none';
}

function uploadData() {
    var namaMK = document.getElementById('namaMK').value;
    var jumlahAsisten = document.getElementById('jumlahAsisten').value;

    console.log("Nama MataKuliah:", namaMK);
    console.log("Jumlah Asisten:", jumlahAsisten);

    hidePopup();
}


function showDeletePopup(rowNumber) {
    document.getElementById("deleteOverlay").style.display = "block";
    document.getElementById("deletePopup").style.display = "block";

    document.getElementById("deletePopup").setAttribute("data-row-number", rowNumber);
}

function hideDeletePopup() {
    document.getElementById("deleteOverlay").style.display = "none";
    document.getElementById("deletePopup").style.display = "none";
}

function deleteRow() {
    const rowNumber = document.getElementById("deletePopup").getAttribute("data-row-number");
    console.log("Delete row number:", rowNumber);
    hideDeletePopup();
}

function showEditPopup() {
    document.getElementById('edit-popup').style.display = 'block';
    document.getElementById('edit-overlay').style.display = 'block';
}

function hideEditPopup() {
    document.getElementById('edit-popup').style.display = 'none';
    document.getElementById('edit-overlay').style.display = 'none';
}

function saveData() {
    var jumlahAsisten = document.getElementById('jumlahAsisten').value;
    console.log("Jumlah Asisten:", jumlahAsisten);
    hideEditPopup();
}
