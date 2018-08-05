import { connect } from 'react-redux';
import TodoList from './todo_list';
import { receiveTodo, receiveTodos, fetchTodos, createTodo, removeTodo } from '../../actions/todo_actions';
import { receiveErrors, clearErrors } from '../../actions/error_actions';

const mapStateToProps = (state) => ({
  todos: state.todos,
  errors: state.errors
});

const mapDispatchToProps = (dispatch) => ({
  receiveTodo: (todo) => dispatch(receiveTodo(todo)),
  receiveTodos: (todos) => dispatch(receiveTodos(todos)),
  fetchTodos: () => dispatch(fetchTodos()),
  createTodo: (todo) => dispatch(createTodo(todo)),
  receiveErrors: (errors) => dispatch(receiveErrors(errors)),
  removeTodo: (todo) => dispatch(removeTodo(todo))

});

const TodoListContainer = connect(mapStateToProps, mapDispatchToProps)(TodoList);

export default TodoListContainer;
