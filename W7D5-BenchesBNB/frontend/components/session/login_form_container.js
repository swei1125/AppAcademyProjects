import { connect } from 'react-redux';
import SessionForm from './session_form';
import { login } from '../../actions/session_actions';
import {withRouter} from 'react-router-dom';

const mapStateToProps = ({ errors }, ownProps) => ({
  errors: errors.session,
  formType: 'login'
});

const mapDispatchToProps = (dispatch, ownProps) => ({
  processForm: (user) => dispatch(login(user))
});

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(SessionForm));
