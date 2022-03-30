import React, {Component} from 'react';
import './App.css';
import {TweetListComponent} from "./tracks/tweets/tweet-list.component";

export default class App extends Component {

    render() {
        return (
            <div className="App">
                <TweetListComponent/>
            </div>
        );
    }
}
