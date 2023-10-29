
const map = L.map('map').setView([12.9716, 77.5946], 13);
L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 19,
}).addTo(map);

// Fetch and display grievance data (you would typically fetch this from a server or API)
const grievances = [
    { grievanceType: "Water Issue", lat: 12.9716, lng: 77.5946, description: "Water pipe leak" },
    // Add more grievance data as needed
];

grievances.forEach(grievance => {
    L.marker([grievance.lat, grievance.lng]).addTo(map)
        .bindPopup(grievance.description);
});
const grievanceTypeSelect = document.getElementById('grievance-type');
const waterProblemQuestions = document.getElementById('water-problem-questions');
const electricityProblemQuestions = document.getElementById('electricity-problem-questions');
const sewerProblemQuestions = document.getElementById('sewer-problem-questions');

grievanceTypeSelect.addEventListener('change', () => {
    const selectedType = grievanceTypeSelect.value;
    waterProblemQuestions.style.display = selectedType === 'Water' ? 'block' : 'none';
    electricityProblemQuestions.style.display = selectedType === 'Electricity' ? 'block' : 'none';
    sewerProblemQuestions.style.display = selectedType === 'Sewer' ? 'block' : 'none';
});


// Implement grievance submission and back-end integration here.