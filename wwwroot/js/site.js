//// javascript for opening tabs

//// this code was adapted from W3schools (https://www.w3schools.com/howto/howto_js_tabs.asp)
function openTab(evt, tabName) {
    var x, tabContent, tabLinks;

    tabContent = document.getElementsByClassName("tabContent");
    for (x = 0; x < tabContent.length; x++) {
        tabContent[x].style.display = "none";
    }
    tabLinks = document.getElementsByClassName("btns");
    for (x = 0; x < tabLinks.length; x++) {
        tabLinks[x].className = tabLinks[x].className.replace(" active", "");
    }
    document.getElementById(tabName).style.display = "block";
    evt.currentTarget.className += " active";
}



function setupLecturerModal() {
    const modal = document.getElementById("hrModal");
    const closeButton = document.querySelector(".hrClose");
    console.log('Helllooooooooooo');
    // Open modal with lecturer details
    document.querySelectorAll('.btn-view-hr').forEach(button => {
        button.addEventListener('click', function () {
            // Extract data attributes
            const lecId = this.getAttribute('data-lec-ID');
            const lecName = this.getAttribute('data-lec-Name');
            const lecSurname = this.getAttribute('data-lec-Surname');
            const lecEmail = this.getAttribute('data-lec-Email');
            const lecPhone = this.getAttribute('data-lec-phone');
            const lecHourlyRate = this.getAttribute('data-lec-hourlyRate');
            const lecUsername = this.getAttribute('data-lec-username');

            // Populate modal fields
            document.getElementById('lec-id').value = lecId;
            document.getElementById('lec-name').value = lecName;
            document.getElementById('lec-surname').value = lecSurname;
            document.getElementById('lec-email').value = lecEmail;
            document.getElementById('lec-phone').value = lecPhone;
            document.getElementById('lec-hourly').value = lecHourlyRate;
            document.getElementById('lec-username').value = lecUsername;

            // Show modal
            modal.style.display = "block";
        });
    });

    // Close modal
    closeButton.addEventListener('click', function () {
        modal.style.display = "none";
    });

    // Close modal when clicking outside
    window.addEventListener('click', function (event) {
        if (event.target === modal) {
            modal.style.display = "none";
        }
    });
}

// Function to handle modal actions for claims
function setupClaimModal() {
    const modal = document.getElementById("myModal");
    const closeButton = document.querySelector(".claimClose");
    console.log("This is the original");
    // Open modal with claim details
    document.querySelectorAll('.btn-view').forEach(button => {
        button.addEventListener('click', function () {
            // Extract data attributes
            const claimId = this.getAttribute('data-claim-id');
            const lecturerId = this.getAttribute('data-lecturer-id');
            const claimAmount = this.getAttribute('data-claim-amt');
            const dateOfClaim = this.getAttribute('data-dateofClaim');
            const filePath = this.getAttribute('data-suppDocs');
            const status = this.getAttribute('data-status');
            const staffId = this.getAttribute('data-staff-id');

            // Populate modal fields
            document.getElementById('approve_claim_id').value = claimId;
            document.getElementById('reject_claim_id').value = claimId;
            document.getElementById('cl_status').value = status;
            document.getElementById('app_s_id').value = staffId;
            document.getElementById('reject_s_id').value = staffId;

            document.getElementById('claimid').innerText = claimId;
            document.getElementById('lecturerID').innerText = lecturerId;
            document.getElementById('claimAmt').innerText = claimAmount;
            document.getElementById('dateofclaim').innerText = dateOfClaim;
            document.getElementById('suppDocs').innerText = filePath;
            document.getElementById('status').innerText = status;

            // Show modal
            modal.style.display = "block";
        });
    });

    // Close modal
    closeButton.addEventListener('click', function () {
        modal.style.display = "none";
    });

    // Close modal when clicking outside
    window.addEventListener('click', function (event) {
        if (event.target === modal) {
            modal.style.display = "none";
        }
    });
}
function setupClaimModalNumber2() {
    console.log("BYEEEEEEEEEEEEEEEEEEEEEEEEEEEE");
    
    const closeButton2 = document.querySelector(".claim2Close");
    var modal2 = document.getElementById('clModal');
    // Open modal with claim details
    document.querySelectorAll('.btn-view-c').forEach(button => {
        button.addEventListener('click', function () {
            // Extract data attributes
            const claimId = this.getAttribute('data-claimID');
            const lecturerId = this.getAttribute('data-lecID');
            const claimAmount = this.getAttribute('data-claimAmount');
            const dateOfClaim = this.getAttribute('data-dateofclaim');
            const hoursWorked = this.getAttribute('data-hoursWorked');
            const status = this.getAttribute('data-status');
            const description = this.getAttribute('data-description');

            // Populate modal fields
            document.getElementById('ClaimID').value = claimId;
            document.getElementById('ClaimID2').value = claimId;
            document.getElementById('FkLecID').value = lecturerId;
            document.getElementById('HoursWorked').value = hoursWorked;
            document.getElementById('Description').value = description;
            document.getElementById('DateofClm').value = dateOfClaim;
            document.getElementById('ClmAmt').value = claimAmount;
            document.getElementById('Status').value = status;


            // Show modal
            modal2.style.display = 'block';
        });
    });

    // Close modal
    closeButton2.addEventListener('click', function () {
        modal2.style.display = "none";
    });

    // Close modal when clicking outside
    window.addEventListener('click', function (event) {
        if (event.target === modal) {
            modal2.style.display = "none";
        }
    });
}
// this code was adapted from : https://developer.mozilla.org/en-US/docs/Web/API/Document/DOMContentLoaded_event
document.addEventListener('DOMContentLoaded', function () {
    setupLecturerModal();
    
   
});
document.addEventListener('DOMContentLoaded', setupClaimModalNumber2);
document.addEventListener('DOMContentLoaded', setupClaimModal);

function CalculateClaimAmount() {
    var hourlyRate = parseFloat(document.getElementById("he-rate").textContent);
    var hoursWorked = parseFloat(document.getElementById("hrs-worked").value);
    var claimAmount = parseFloat(document.getElementById("claim-amt").value);
    
    if (hoursWorked > 160 || hoursWorked < 0) {
        alert("You may not enter a number greater than 160 or less than 0.");
        document.getElementById("hrs-worked").value = 0;
        document.getElementById("claim-amt").value = 0;
    }
    claimAmount = hourlyRate * hoursWorked;
    document.getElementById("claim-amt").value = claimAmount;
}

//popup for infomation tracking
function myPopup() {
    var popup = document.getElementById("myPopup");
    popup.classList.toggle("show");
}






///*
//Reference List:
//Anon., n.d. How TO - CSS/JS Modal. [Online]
//Available at: https://www.w3schools.com/howto/howto_css_modals.asp
//[Accessed 15 July 2024].
//W3Schhols, 2024. How TO - Tabs. [Online]
//Available at: https://www.w3schools.com/howto/howto_js_tabs.asp
//[Accessed 5 July 2024].
//mdn web docs, 2024. Document: DOMContentLoaded event. [Online]
//Available at: https://developer.mozilla.org/en-US/docs/Web/API/Document/DOMContentLoaded_event
//[Accessed 18 November 2024]

//*/


