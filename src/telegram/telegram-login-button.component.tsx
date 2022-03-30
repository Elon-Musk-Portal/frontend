import TelegramLoginButton, { TelegramUser } from '@v9v/ts-react-telegram-login';

const handleTelegramResponse = (user: TelegramUser) => {
    console.log(user);
};

export const TelegramLogin = () => {
    return (
        <TelegramLoginButton
            dataOnAuth={handleTelegramResponse}
            buttonSize={"large"}
            requestAccess={true}
            usePic={true}
            botName="elon_musk_portal_bot"
        />
    );
}
