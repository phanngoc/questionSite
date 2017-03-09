import ListComment from './ListComment.jsx'
import AddComment from './AddComment.jsx'
import React from 'react'

var WrapperListComment = React.createClass({

  getInitialState() {
    var dataJson = this.props.data;
      return {
        comments: dataJson.comments,
        parentItem: dataJson
      };
  },

  componentDidMount() {

  },

  addCommentToList(data) {
    var commentCreated = jQuery.parseJSON(data);
    var comments = _.compact(this.state.comments);
    comments.push(commentCreated);
    this.setState({comments: comments});
  },

  removeComment(id) {
    var arr = _.without(this.state.comments, _.findWhere(this.state.comments, {
        id: id
    }));

    this.setState({comments: arr});
  },

  render: function() {

    return (
      <div className="wrapper-comment-answer">
        <ListComment comments={this.state.comments}
          removeComment={this.removeComment} />
        <AddComment commentable_type={this.props.type}
          commentable_id={this.state.parentItem.id}
          comments_path={gon.comments_path}
          addCommentToList={this.addCommentToList}
          />
      </div>
    );
  }
});

export default WrapperListComment;