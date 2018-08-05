import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root';
import configureStore from './store/store';
import { receiveTodo, receiveTodos, fetchTodos } from './actions/todo_actions';
import { allTodos } from './reducers/selectors';
import thunk from './middleware/thunk';


document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('content');
  const store = configureStore();
  window.store = store;
  window.receiveTodo = receiveTodo;
  window.receiveTodos = receiveTodos;
  window.allTodos = allTodos;
  window.fetchTodos = fetchTodos;
  window.thunk = thunk;
  ReactDOM.render(<Root store={store} />, root);
});
