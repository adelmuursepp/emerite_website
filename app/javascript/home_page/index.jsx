import React from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import { createHistory as history } from 'history';

import PostsIndex from './containers/posts_index';




// render an instance of the component in the DOM
ReactDOM.render(
  <Router history={history}>
    <div className="thin-container">
      <Switch>
        <Route path="/" exact component={PostsIndex} />
      </Switch>
    </div>
  </Router>,
  document.getElementById('root')
);
