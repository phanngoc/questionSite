
var VoteQuestion = React.createClass({
  getInitialState() {
    return {
      question: this.props.question,
      act: this.props.flag_up - this.props.flag_down,
      flag_up: this.props.flag_up,
      flag_down: this.props.flag_down,
      number: this.props.question.up_vote - this.props.question.down_vote
    };
  },

  componentDidMount() {

  },

  componentWillReceiveProps(nextProps) {
  },

  handleUp() {
    var self = this;
    $.ajax({
      url: '/questions/' + self.state.question.id,
      method: 'POST',
      dataType: "json",
      data: {_method: "PUT", act: 1}
    }).done(function(result) {
      if (result.status == 1) {
        if (self.state.act == 1) {
          var data = {act: 0, 
            question: Object.assign({}, self.state.question, result.data), 
            number: self.state.number-1,
            flag_up: (1-self.state.flag_up)}
          self.setState(data);
        } else if (self.state.act == -1) {
          self.setState({act: 1,
            number: self.state.number+2,
            question: Object.assign({}, self.state.question, result.data), 
            flag_down: (1-self.state.flag_down),
            flag_up: (1-self.state.flag_up)});
        } else {
          self.setState({act: 1,
            number: self.state.number+1,
            question: Object.assign({}, self.state.question, result.data), 
            flag_up: (1-self.state.flag_up)});
        }
      }
    });
  },

  handleDown() {
    var self = this;
    $.ajax({
      url: '/questions/' + self.state.question.id,
      method: 'POST',
      dataType: "json",
      data: {_method: "PUT", act: 0}
    }).done(function(result) {
      if (result.status == 1) {
        if (self.state.act == -1) {
          self.setState({act: 0, 
            question: Object.assign({}, self.state.question, result.data), 
            number: self.state.number+1,
            flag_down: (1-self.state.flag_down)});
        } else if (self.state.act == 1) {
          self.setState({act: -1,
            number: self.state.number-2,
            question: Object.assign({}, self.state.question, result.data), 
            flag_down: (1-self.state.flag_down),
            flag_up: (1-self.state.flag_up)});
        } else {
          self.setState({act: -1,
            number: self.state.number-1,
            question: Object.assign({}, self.state.question, result.data), 
            flag_down: (1-self.state.flag_down)});
        }
      }
    });
  },

  render() {
    const colorHightlight = {color: 'red'};
    const colorNormal = {color: '#C0C0C0'};
    const styleUp = this.state.flag_up == 1 ? colorHightlight: colorNormal;
    const styleDown = this.state.flag_down == 1 ? colorHightlight: colorNormal;

    return (
      <div className="wr-vote">
        <a href="javascript:" onClick={this.handleUp} className="icon-up">
          <i className="fa fa-sort-asc" aria-hidden="true" style={styleUp}></i>
        </a>
        <span className="number-sum">
          {this.state.number}
        </span>
        <a href="javascript:" onClick={this.handleDown}
          className="icon-down">
            <i className="fa fa-sort-desc" aria-hidden="true" 
              style={styleDown}></i>
        </a>
      </div>
    );
  }

});
