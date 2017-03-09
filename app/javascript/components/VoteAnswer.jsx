import React from 'react'
var VoteAnswer = React.createClass({
  getInitialState() {
    return {
      answer: this.props.answer,
      act: this.props.flag_up - this.props.flag_down,
      flag_up: this.props.flag_up,
      flag_down: this.props.flag_down,
      number: this.props.answer.up_vote - this.props.answer.down_vote
    };
  },

  componentDidMount() {

  },

  componentWillReceiveProps(nextProps) {
  },

  handleUp() {
    var self = this;
    $.ajax({
      url: '/answers/' + self.state.answer.id + '/votes/1',
      method: 'POST',
      data: {_method: "PUT"}
    }).done(function(result) {
      if (result.status == 1) {
        var answer = Object.assign({}, self.state.answer, result.data);
        if (self.state.act == 1) {
          self.setState({act: 0, 
            answer: answer, 
            number: self.state.number-1,
            flag_up: (1-self.state.flag_up)});
        } else if (self.state.act == -1) {
          self.setState({act: 1,
            number: self.state.number+2,
            answer: answer, 
            flag_down: (1-self.state.flag_down),
            flag_up: (1-self.state.flag_up)});
        } else {
          self.setState({act: 1,
            number: self.state.number+1,
            answer: answer, 
            flag_up: (1-self.state.flag_up)});
        }
        self.props.onChangeVote(answer);
      }
    });
  },

  handleDown() {
    var self = this;
    $.ajax({
      url: '/answers/' + self.state.answer.id + '/votes/0',
      method: 'POST',
      data: {_method:"PUT"}
    }).done(function(result) {
      if (result.status == 1) {
        var answer = Object.assign({}, self.state.answer, result.data);
        if (self.state.act == -1) {
          self.setState({act: 0, 
            answer: answer, 
            number: self.state.number+1,
            flag_down: (1-self.state.flag_down)});
        } else if (self.state.act == 1) {
          self.setState({act: -1,
            number: self.state.number-2,
            answer: answer, 
            flag_down: (1-self.state.flag_down),
            flag_up: (1-self.state.flag_up)});
        } else {
          self.setState({act: -1,
            number: self.state.number-1,
            answer: answer, 
            flag_down: (1-self.state.flag_down)});
        }
        self.props.onChangeVote(answer);
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

export default VoteAnswer;