class ActionStateButton extends React.Component {
  render () {
    return (
      <div className="btn state-action-btn" onClick={this.props.onClick}>
        <div className="btn-action">{this.props.action}</div>
        <div className="btn-state">{this.props.state}</div>
      </div>
    );
  }
}

ActionStateButton.defaultProps = {
  onClick: () => {}
};
ActionStateButton.propTypes = {
  action: React.PropTypes.node.isRequired,
  state: React.PropTypes.node.isRequired,
  onClick: React.PropTypes.func
};
