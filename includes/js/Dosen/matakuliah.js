
function openAsistenDosen() {
    window.location.href = '/AsistenDosen';
}

function openMatakuliah() {
    window.location.href = '/Matakuliah';
}

function openProfileDosen() {
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

function getOptionByValue(value) {
    var selectedOption = document.getElementById('namaMK')
    for (var i = 0; i < selectedOption.options.length; i++) {
        if (selectedOption.options[i].value === value) {
            return selectedOption.options[i];
        }
    }
    return null;
}


// function uploadData() {

//     var selectedJumlahAsisten = document.getElementById('jumlahAsisten').value;
//     hidePopup();
// }

function tambahMataKuliah() {
    var subjectId = document.getElementById('namaMK').value;
    var assistantQuota = document.getElementById('jumlahAsisten').value;

    // Create an object to send as JSON data
    var data = { subjectId, assistantQuota };

    // Use fetch or XMLHttpRequest to send data to the server
    fetch('/matakuliah', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    })
        .then(response => response.json())
        .then(data => {
            // Handle the response from the server (you can update UI or show a message)
            console.log(data.message);
            addRowToTable(data);
            hidePopup();
        })
        .catch(error => {
            // Handle any errors that occurred during the fetch
            console.error('Error:', error);
        });
}

function addRowToTable(newSubject) {
    var table = document.querySelector('table tbody');

    // Create a new row
    var newRow = table.insertRow();

    // Insert cells with data
    var cell1 = newRow.insertCell(0);
    var cell2 = newRow.insertCell(1);
    var cell3 = newRow.insertCell(2);
    var cell4 = newRow.insertCell(3);

    // Assign values to cells
    cell1.innerHTML = table.rows.length;
    cell2.innerHTML = newSubject.title;
    cell3.innerHTML = newSubject.asdos_quota;
    cell4.innerHTML = `<span class="material-icons-outlined" onclick="showEditPopup('${newSubject.id}')">edit</span>
                      <span class="material-icons-outlined" onclick="showDeletePopup('${newSubject.id}')">delete</span>`;
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
    const rowNumber = document.getElementById("deletePopup").rows;

    const rowNumberId = document.getElementById("deletePopup").getAttribute("data-row-number");

    var table = document.querySelector('table tbody');

    table.deleteRow(rowNumber);

    // Use fetch or XMLHttpRequest to send delete request to the backend
    fetch(`/matakuliah/${rowNumberId}`, {
        method: 'DELETE',
    })
        .then(response => response.json())
        .then(data => {
            // Handle the response from the server (you can update UI or show a message)
            console.log(data);
            hideDeletePopup();
        })
        .catch(error => {
            // Handle any errors that occurred during the fetch
            console.error('Error:', error);
            hideDeletePopup();
        });

    hideDeletePopup();
}

function showEditPopup(rowNumber) {
    document.getElementById('edit-popup').style.display = 'block';
    document.getElementById('edit-overlay').style.display = 'block';
    document.getElementById("edit-popup").setAttribute("data-row-number", rowNumber);
}

function hideEditPopup() {
    document.getElementById('edit-popup').style.display = 'none';
    document.getElementById('edit-overlay').style.display = 'none';
}
function saveData() {
    // data terbaru
    var newJumlahAsisten = document.getElementById('edit-popup').querySelector('#jumlahAsisten').value;

    const rowNumberId = document.getElementById("edit-popup").getAttribute("data-row-number");

    // Use fetch or XMLHttpRequest to send delete request to the backend
    fetch(`/matakuliah/${rowNumberId}`, {
        method: 'PUT',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ asdosQuota: newJumlahAsisten }),
    })
        .then(response => response.json())
        .then(data => {
            // Hide the edit popup
            hideEditPopup();
            location.reload();
        })
        .catch(error => {
            // Handle any errors that occurred during the fetch
            console.error('Error:', error);
            hideEditPopup();
        });
}
