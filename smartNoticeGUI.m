function smartNoticeGUI
% SMART NOTICE BOARD
% This application allows a teacher to type a notice and send it to
% students through Telegram using the Telegram Bot API.

fig = uifigure('Name', 'Smart Notice Board', ...
    'Position', [100 100 600 400]);

% Text Area
txt = uitextarea(fig, ...
    'Position', [50 150 500 150]);

% Status Label
statusLabel = uilabel(fig, ...
    'Text', 'Status: Ready', ...
    'Position', [50 120 400 30]);

% Send Button
uibutton(fig, 'push', ...
    'Text', 'Send Notice', ...
    'Position', [230 50 140 40], ...
    'ButtonPushedFcn', @(btn,event) sendNotice());

%% Send Notice Function
    function sendNotice()

        message = txt.Value;

        % Check if message is empty
        if isempty(message) || all(cellfun(@isempty, message))
            uialert(fig, 'Please enter a notice before sending.', ...
                'Warning');
            return;
        end

        msg = strjoin(message, ' ');

        try
            sendTelegramMessage(msg);
            statusLabel.Text = "Status: Message Sent Successfully";
        catch ME
            statusLabel.Text = "Status: Failed to Send";
            uialert(fig, ...
                sprintf('Error:\n%s', ME.message), ...
                'Telegram Error');
        end

    end

end