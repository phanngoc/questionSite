var Answer = React.createClass({

	getInitialState() {
    var answer = jQuery.parseJSON(this.props.answer);
		return {
      answer: answer,
      content: answer.content,
      isShow: false,
		}
	},
	componentDidMount() {

		var $formEditAnswer = $(ReactDOM.findDOMNode(this.refs.formEditAnswer));
		var $btnSave = $(ReactDOM.findDOMNode(this.refs.btnSave));
    var $btnCancel = $(ReactDOM.findDOMNode(this.refs.btnCancel));
		var self = this;

		$formEditAnswer.submit(function(e){
      e.preventDefault();
    });

    $btnSave.click(function() {
    	var formdata = new FormData($formEditAnswer[0]);

    	$.ajax({
			    url: self.props.answer_path,
			    method: 'POST',
			    processData: false,
	        contentType: false,
			    data: formdata
			}).done(function(result) {
          if (result.state == 1) {
              self.setState({isShow: false});
          }
			});
    });
	},

  showEditForm: function() {
    this.setState({isShow: true});
  },

  cancelEditForm: function() {
    this.setState({isShow: false});
  },

  handleChangeContent: function(e) {
    this.setState({content: e.target.value});
  },

	render: function() {
		var styleEdit = this.state.isShow ? {display: "block"} : {display: "none"};
    var styleShow = this.state.isShow ? {display: "none"} : {display: "block"};
		return (
      <div className="fr-answer">
        <table className="answer">
          <tbody>
            <tr>
              <td>
                <div className="wr-content-answer" dangerouslySetInnerHTML={{__html: this.state.content}} style={styleShow}>
                </div>
                <div className="wr-edit-answer">
                  <form action={this.props.answer_path} className="form-edit-answer" method="post" ref="formEditAnswer" style={styleEdit}>
                    <input type="hidden" name="_method" value="PUT"/>
                    <table className="ta-edit-answer ta-fix" cellPadding="0" cellSpacing="0" width="100%">
                      <tbody>
                        <tr>
                          <td>
                            <textarea className="form-control" name="content" defaultValue={this.state.content} onChange={this.handleChangeContent}></textarea>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <a href="javascript:" className="btn btn-default" ref="btnCancel" onClick={this.cancelEditForm}>{I18n.t("question_page.cancel")}</a>
                            <button type="submit" className="btn btn-primary btn-save" ref="btnSave">{I18n.t("question_page.save")}</button>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </form>
                </div>
              </td>
            </tr>
            <tr>
              <td className="wr-menu-action">
                <ul className="menu-action">
                  <li><a href="#" className="ac-share">{I18n.t("question_page.share")}</a></li>
                  <li><a href="javascript:" className="ac-edit" onClick={this.showEditForm}>{I18n.t("question_page.edit")}</a></li>
                  <li><a href="#" className="ac-flag">{I18n.t("question_page.flag")}</a></li>
                </ul>
              </td>
              <td className="td-wr-author">
                <div className="user-info">
                  <div className="user-avatar">
                    <a href="javascript:"><img src={this.state.answer.user.avatar.url} alt="" width="40" height="40" /></a>
                  </div>
                  <div className="user-name"><a href="#">{this.state.answer.user.name}</a></div>
                </div>
              </td>
             </tr>

             <tr>
                <td className="pa-comment" colSpan="2">
                    <WrapperListComment type='Answer' data={this.props.answer} />
                </td>
             </tr>
          </tbody>
        </table>
      </div>
		);
	}
});
