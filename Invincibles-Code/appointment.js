function scheduleAppointment() {
    var date = document.getElementById("date").value;
    var time = document.getElementById("time").value;
    var appointmentInfo = `Date: ${date}, Time: ${time}`;
    var listItem = document.createElement("li");
    listItem.appendChild(document.createTextNode(appointmentInfo));
    document.getElementById("appointments-list").appendChild(listItem);
}

