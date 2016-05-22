import React from 'react'

class Main extends React.Component {
    constructor(props) {
        super(props);
        this.bound = {
            onTitleChange: this.onTitleChange.bind(this)
        }
    }

    onTitleChange(event) {
        this.props.actions.updateTitle(event.target.value);
    }

    render() {
        return (
            <div>
                <h1>{this.props.title}</h1>
                <div>
                    <input type="text" onChange={this.bound.onTitleChange} />
                </div>
            </div>
        )
    }
}

export default Main
