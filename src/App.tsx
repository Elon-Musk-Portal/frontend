import React, {Component} from 'react';
import './App.css';
import {TweetListComponent} from "./tracks/tweets/tweet-list.component";
import {TelegramLogin} from "./telegram/telegram-login-button.component";

export default class App extends Component {

    render() {
        return (
            <div className="App">
                <div><TweetListComponent/></div>
                {/*<div><TelegramLogin/></div>*/}
            </div>
        );
    }
}
