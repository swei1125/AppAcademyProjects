import React from 'react';
import {Redirect, Route, withRouter} from 'react-router-dom';
import {connect} from 'react-redux';

const mapStateToProps = state => {
  return {loggedIn: Boolean(state.session.id)};
};

const Auth = ({path, loggedIn, exact, component: Component}) => (
  <Route path={path} exact={exact} render={props => (
      loggedIn ? <Redirect to='/' /> : <Component {...props} />
    )} />
);

const Protected = ({path, loggedIn, exact, component: Component}) => (
  <Route path={path} exact={exact} render={props => (
      loggedIn ? <Component {...props} /> : <Redirect to='/login' />
    )} />
);

export const AuthRoute = withRouter(connect(mapStateToProps)(Auth));

export const ProtectedRoute = withRouter(connect(mapStateToProps)(Protected));
