
const communityProblems = [
    { name: "Water Issue", lat: 12.9716, lng: 77.5946 },
    { name: "Electricity Problem", lat: 12.9364, lng: 77.6257 },
    { name: "Sewer Problem", lat: 12.9716, lng: 77.6101 },
    // Add more data points as needed
];

// Initialize the map
const map = L.map('map').setView([12.9716, 77.5946], 13);

// Adding a tile layer to the map (you can use other tile providers)
L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 19,
}).addTo(map);

// Adding markers for community problems
communityProblems.forEach(problem => {
    L.marker([problem.lat, problem.lng]).addTo(map)
        .bindPopup(problem.name);
});