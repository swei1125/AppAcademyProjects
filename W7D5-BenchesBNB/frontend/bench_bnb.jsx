import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import {login, signup} from './actions/session_actions';
import {fetchBenches} from './actions/bench_actions';

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  let store;
  if (window.currentUser) {
    const preloadedState = {
      entities: {
        users: {[window.currentUser.id]: window.currentUser}
      },
      session: {id: window.currentUser.id}
    };
    store = configureStore(preloadedState);
  }else {
    store = configureStore();
  }


  window.dispatch = store.dispatch;
  window.getState = store.getState;
  window.fetchBenches = fetchBenches;


  ReactDOM.render(<Root store={store} />, root);
});
