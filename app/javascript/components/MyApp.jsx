import ReactHabitat from 'react-habitat'
import Answer from './Answer.jsx'

class MyApp extends ReactHabitat.Bootstrapper {
  constructor(){
    super();

    // Create a new container builder
    var container = new ReactHabitat.Container();

    // Register your top level component(s) (ie mini/child apps)
    container.register('Answer', Answer);

    // Finally, set the container
    this.setContainer(container);
  }
}

// Always export a 'new' instance so it immediately evokes
export default new MyApp();