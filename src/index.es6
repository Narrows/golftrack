
import ReactDOM from 'react-dom'
import React from 'react'
import Main from './Main.es6'

/**
 * Performans a modification on state
 */
const modState = (mod) => {
    let new_state = mod(Object.assign({}, state));
    state = new_state;
    render(state);
}

/**
 * Rerenders w/ state
 */
const render = (props) => {
    ReactDOM.render(
        <Main {...props} />,
        document.getElementById('main')
    );
}

/**
 * The state!
 */
let state = {
    title: 'golftracker',
    actions: {
        updateTitle: (title) => {
            modState((s) => {
                s.title = title;
                return s
            })
        }
    }
}

render(state)
