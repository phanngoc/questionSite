import React from 'react'
import reactCSS from 'reactcss'

var WrapBoxRequest = React.createClass({
	getInitialState() {
    console.log(this.props);
		return {
      isRequest: false,
      shortPeople: [],
      question: this.props.question
		}
	},

  componentDidMount() {
    this.loadPeople();
  },

  loadPeople() {
    var self = this;
    $.ajax({
      method: "GET",
      url: "/questions/" + this.state.question.id + "/populars",
      done: function(result) {
        console.log(result);
      }
    })
  },

	render() {
    var styles = reactCSS({
      'default': {
        boxExtend: {
          display: "none",
        },
      },
      'isRequest': {
        boxExtend: {
          display: "block"
        }
      }
    }, this.state);

		return (
      <div className="wr-box-request">
        <a className="target-expand btn btn-default" onClick="">Request</a>
        <div className="expand-box">
          <div className="header">Request Answers</div>
          <div className="box-list">

          </div>
        </div>
      </div>
		);
	}
});

export default WrapBoxRequest;