import {RECEIVE_TODO, RECEIVE_TODOS, REMOVE_TODO } from '../actions/todo_actions';
import merge from 'lodash/merge';
import allTodos from './selectors';


const initialState = {
  1: {
    id: 1,
    title: 'wash car',
    body: 'with soap',
    done: false
  },
  2: {
    id: 2,
    title: 'wash dog',
    body: 'with shampoo',
    done: true
  },
};

const todosReducer = (state = initialState, action) => {
  switch(action.type) {
    case RECEIVE_TODOS:
      let result = {};
      action.todos.forEach(todo => result[todo.id] = todo);
      return result;

    case RECEIVE_TODO:
      let copyState = merge({}, state);
      let todo = {};
      todo[action.todo.id] = action.todo;
      copyState = merge(copyState, todo);

      return copyState;

    case REMOVE_TODO:
      let todos = allTodos(state);
      let idx = todos.indexOf(action.todo);
      console.log(todos);
      todos = todos.slice(0, idx).concat(todos.slice(idx+1));
      let result2 = {};
      todos.forEach( todo => result[todo.id] = todo );
      return result2;

    default:
      return state;
  }
};


export default todosReducer;
