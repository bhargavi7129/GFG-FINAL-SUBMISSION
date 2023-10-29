document.addEventListener("DOMContentLoaded", function() {
    const chatLog = document.getElementById("chat-log");
    const userMessage = document.getElementById("user-message");
    const sendButton = document.getElementById("send-button");

    sendButton.addEventListener("click", function() {
        const message = userMessage.value.trim();
        if (message !== "") {
            appendMessage("You", message);
            userMessage.value = "";

            if (message.toLowerCase().includes("contact a doctor")) {
                appendDoctorResponse();
            }
        }
    });

    function appendMessage(sender, message) {
        const messageDiv = document.createElement("div");
        messageDiv.className = "message";
        messageDiv.innerHTML = `<strong>${sender}:</strong> ${message}`;
        chatLog.appendChild(messageDiv);
        chatLog.scrollTop = chatLog.scrollHeight;
    }

    function appendDoctorResponse() {
        appendMessage("Chatbot", "You've chosen to contact a doctor. Here's the doctor's contact information:");
        appendMessage("Chatbot", `<span class="phone-number">Phone Number:</span> +123-456-7890`);
        appendMessage("Chatbot", "Available Meeting Slots:");

        const slots = ["Tomorrow at 10:00 AM", "Next Monday at 3:00 PM"];

        const slotsList = document.createElement("ul");
        slotsList.className = "meeting-slots";

        slots.forEach(slot => {
            const slotItem = document.createElement("li");
            slotItem.textContent = slot;
            slotsList.appendChild(slotItem);
        });

        chatLog.appendChild(slotsList);
    }
});
