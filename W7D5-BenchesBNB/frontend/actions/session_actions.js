import * as SessionAPI from '../utils/session_api_utils';

export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";
export const LOGOUT_CURRENT_USER = "LOGOUT_CURRENT_USER";
export const RECEIVE_ERRORS = "RECEIVE_ERRORS";

export const receiveCurrentUser = (user) => ({
  type: RECEIVE_CURRENT_USER,
  user
});

export const logoutCurrentUser = () => ({
  type: LOGOUT_CURRENT_USER,
});

export const receiveErrors = (errors) => ({
  type: RECEIVE_ERRORS,
  errors
});

export const login = (user) => dispatch => (
  SessionAPI.login(user)
  .then(
    newuser => dispatch(receiveCurrentUser(newuser)),
    err => dispatch(receiveErrors(err.responseJSON))
  )
);

export const signup = (user) => dispatch => (
  SessionAPI.signup(user)
  .then(
    newuser => dispatch(receiveCurrentUser(newuser)),
    err => dispatch(receiveErrors(err.responseJSON))
  )
);

export const logout = () => dispatch => (
  SessionAPI.logout()
  .then(() => dispatch(logoutCurrentUser()))
);
