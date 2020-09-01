import React from 'react';

import { render } from 'react-dom';
import { BrowserRouter, Match, Miss } from 'react-router';
import 'whatwg-fetch';

import './styles/main.scss';
import NotFound from './containers/NotFound';

const Root = () => {
  return (
    <BrowserRouter>
      <div>
        <Match pattern="/" exactly component={Demo} />
        <Match pattern="/feedbackapp" exactly component={FeedbackApp} />
        <Miss component={NotFound} />
      </div>
    </BrowserRouter>
  )
}

render(<Root/>, document.querySelector('#mount'));
