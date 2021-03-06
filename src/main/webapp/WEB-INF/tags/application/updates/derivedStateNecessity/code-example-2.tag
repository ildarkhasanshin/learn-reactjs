<%@ tag pageEncoding="UTF-8" %>
<%@ include file="../../../baseAttr.tag" %>
<%@taglib prefix="cd" tagdir="/WEB-INF/tags/application/code" %>

<%@ attribute name="cssClass" required="false" rtexprvalue="true" %>
<%@ attribute name="name" required="false" rtexprvalue="true" %>
<%@ attribute name="id" required="false" rtexprvalue="true" %>
<%@ attribute name="codePenUrl" required="false" rtexprvalue="true"%>

<cd:code-example-decorator codePenUrl="${codePenUrl}">
  <pre class="prettyprint">
    <code class="language-javascript">
	class EmailInput extends Component {
	  state = {
	    email: this.props.email
	  };
	
	  componentWillReceiveProps(nextProps) {
	    // Каждый раз, когда props.email изменяется, состояние обновляется.
	    if (nextProps.email !== this.props.email) {
	      this.setState({
	        email: nextProps.email
	      });
	    }
	  }
	  
	  // ...
	}</code>
  </pre>
</cd:code-example-decorator>