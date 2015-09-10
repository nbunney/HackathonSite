class RegisterButton extends React.Component {
  constructor(props) {
    super(props);
    this.unregister = this.unregister.bind(this);
    this.register = this.register.bind(this);

    this.state = {
      registered: props.registered,
      loading: false,
      errored: false
    };
  }

  unregister () {
    this.setState({ registered: false });
  }

  register () {
    this.setState({ loading: true });
    fetch(this.props.action, {
      method: this.props.method
    })
    .then((res) => {
      if (res.status >= 200 && res.status < 300) {
        this.setState({ registered: true, loading: false });
      } else {
        this.setState({ error: 'Something went wrong', loading: false });
      }
    });
  }

  render () {
    if (this.state.error) {
      return <div className="btn btn-danger">{this.state.error}</div>;
    }
    if (this.state.loading) {
      return <div className="btn btn-primary"><Spinner /></div>;
    }

    if (this.state.registered) {
      let action = <span><i className="fa fa-times"></i> Unregister</span>;
      let state = <span><i className="fa fa-check"></i> Registered</span>;

      return (
        <ActionStateButton state={state} action={action} onClick={this.unregister} />
      );
    }

    return (
      <div onClick={this.register} className="btn btn-primary">Register</div>
    );
  }
}

RegisterButton.defaultProps = {
  registered: false
};
RegisterButton.propTypes = {
  action: React.PropTypes.string,
  method: React.PropTypes.string,
  registered: React.PropTypes.bool
};
