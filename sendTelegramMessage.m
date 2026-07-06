function response = sendTelegramMessage(msg)
% SENDTELEGRAMMESSAGE
% Sends a text message from MATLAB to Telegram using the Telegram Bot API.
%
% Before running:
% 1. Create a Telegram Bot using @BotFather.
% 2. Replace YOUR_BOT_TOKEN with your Bot Token.
% 3. Replace YOUR_CHAT_ID with your Telegram Channel or Chat ID.
%
% NOTE:
% Never upload your real Bot Token to GitHub.

%% Telegram Configuration

botToken = 'YOUR_BOT_TOKEN';
chatID   = 'YOUR_CHAT_ID';     % Example: '@MyChannel' or '-100xxxxxxxxxx'

%% Telegram API URL

url = ['https://api.telegram.org/bot' botToken '/sendMessage'];

%% Data to Send

data = struct;
data.chat_id = chatID;
data.text = msg;

%% HTTP Options

options = weboptions('MediaType','application/json');

%% Send Message

response = webwrite(url, data, options);

end