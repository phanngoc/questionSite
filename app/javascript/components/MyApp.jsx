import ReactHabitat from 'react-habitat'
import Answer from './Answer.jsx'
import WrapBoxRequest from './requestAnswer/WrapBoxRequest.jsx'
import Notifi from './Notifi.jsx'

class MyApp extends ReactHabitat.Bootstrapper {
  constructor(){
    super();

    // Create a new container builder
    var container = new ReactHabitat.Container();

    // Register your top level component(s) (ie mini/child apps)
    container.register('Answer', Answer);
    container.register('WrapBoxRequest', WrapBoxRequest);
    container.register('Notifi', Notifi);

    // Finally, set the container
    this.setContainer(container);
  }
}

// Always export a 'new' instance so it immediately evokes
export default new MyApp();