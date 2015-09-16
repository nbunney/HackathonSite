// TODO: flux architecture
class RegisterButton extends React.Component {
  constructor(props) {
    super(props);

    this.clearError = this.clearError.bind(this);
    this.unregister = this.unregister.bind(this);
    this.register = this.register.bind(this);

    this.state = {
      participant: props.participant,
      loading: false,
      error: null
    };
  }

  clearError () {
    this.setState({ error: null });
  }

  unregister () {
    let pid = this.state.participant;
    let url = this.props.destroyAction.replace(':participant_id', pid);

    this.setState({ loading: true });
    grab(url, {
      method: 'delete',
      credentials: 'same-origin'
    })
    .then(() => {
      this.setState({ participant: null, loading: false });
    }).catch((e) => {
      this.setState({ error: 'Something went wrong', loading: false });
    });
  }

  register () {
    this.setState({ loading: true });
    grab.json(this.props.createAction, {
      credentials: 'same-origin',
      method: 'post'
    })
    .then((json) => {
      this.setState({ participant: json.id, loading: false });
    }).catch((e) => {
      this.setState({ error: 'Something went wrong', loading: false });
    });
  }

  render () {
    if (this.state.error) {
      return (
        <div className="btn btn-danger registration-btn" onClick={this.clearError}>
          {this.state.error}
        </div>
      );
    }
    if (this.state.loading) {
      return <div className="btn btn-primary registration-btn"><Spinner /></div>;
    }

    if (this.state.participant) {
      let action = <span>Unregister</span>;
      let state = <span><i className="fa fa-check"></i> Registered</span>;

      return (
        <ActionStateButton state={state} action={action} onClick={this.unregister} />
      );
    }

    return (
      <div onClick={this.register} className="btn btn-primary registration-btn">Register</div>
    );
  }
}

RegisterButton.propTypes = {
  createAction: React.PropTypes.string.isRequired,
  destroyAction: React.PropTypes.string.isRequired,
  participant: React.PropTypes.string
};
