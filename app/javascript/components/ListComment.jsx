import ItemComment from './ItemComment.jsx'
import React from 'react'

var ListComment = React.createClass({
  getInitialState() {
    return {
      comments: this.props.comments,
      comments_show: [],
      offset: 0,
      limit: 6
    }
  },

  componentDidMount() {
    this.state.comments_show = _.union(this.state.comments_show,
      this.state.comments.slice(this.state.offset, 
      this.state.offset + 4));
    this.state.offset = this.state.offset + 4 - 1;
    this.setState({comments_show: this.state.comments_show,
      offset: this.state.offset});
  },

  removeComment(id) {
    this.props.removeComment(id);
  },

  componentWillReceiveProps(nextProps) {
    if (this.state.comments.length != nextProps.comments.length) {
      this.state.comments_show = nextProps.comments
    }
    this.state.comments = nextProps.comments;
  },

  loadMore() {
    this.state.comments_show = _.union(this.state.comments_show,
      this.state.comments.slice(this.state.offset, 
      this.state.offset + this.state.limit));
    this.state.offset = this.state.offset + this.state.limit - 1;
    this.setState({comments_show: this.state.comments_show,
      offset: this.state.offset});
  },
  render: function() {
    var rows = [];
    var self = this;
    this.state.comments_show.forEach(function(comment, key) {
      rows.push(
        <ItemComment comment={comment} key={key}
          removeComment={self.removeComment} />
      );
    });
    let style = {};
    if (this.state.comments_show.length == this.state.comments.length)
    {
      style = {display: "none"}
    }
    return (
      <div className="list-comments ta-fix">
        {rows}
        <a className="loadmore" onClick={this.loadMore} style={style}>
          {I18n.t("question_page.load_more")}</a>
      </div>
    );
  }
});

export default ListComment;
