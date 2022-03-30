import React from "react";
import {server} from "../../server";
import {TwitterTweetEmbed} from "react-twitter-embed";

interface IProps {
}

interface IState {
    listTweets: Array<TweetModel>;
    isReady: Boolean;
    hasError: Boolean;
}

class TweetModel {
    id: number;
    tweetId: string;

    constructor(id: number, tweetId: string) {
        this.id = id;
        this.tweetId = tweetId;
    }
}

export class TweetListComponent extends React.Component<IProps, IState> {

    constructor(props: IProps) {
        super(props);
        this.state = {
            isReady: false,
            listTweets: Array<TweetModel>(),
            hasError: false,
        };
    }

    public componentDidMount() {
        server.get('/tweets')
            .then((response) => {
                this.setState({listTweets: response.data});
            })
            .catch((error) => {
                console.log(error)
                this.setState({hasError: true});
            })
            .then(() => {
                this.setState({isReady: true});
            });
    }

    public render() {
        if (this.state.isReady) {
            return (
                <div>
                    {
                        this.state.listTweets.map((object, i) => {
                            return <div key={i}>
                                <TwitterTweetEmbed
                                    tweetId={object.tweetId}
                                    options={
                                        {
                                            "data-lang": "ru"
                                        }
                                    }
                                />
                            </div>;
                        })
                    }
                </div>
            )
        }
        else {
            return (
                <div>{"Loading Content"}</div>
            )
        }
    }
}
