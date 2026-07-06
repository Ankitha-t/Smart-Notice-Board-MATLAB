% TEST TELEGRAM BOT CONNECTION
% Replace the configuration inside sendTelegramMessage.m first.

clc;
clear;

message = "Hello from MATLAB! 🚀";

try
    response = sendTelegramMessage(message);
    disp("Message sent successfully!");
    disp(response);
catch ME
    disp("Failed to send message.");
    disp(ME.message);
end