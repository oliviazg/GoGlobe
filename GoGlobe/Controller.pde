
/**************CONTROLLER TAB************/
  class Controller {
    static final int P1_LEFT = 0;
    static final int P1_RIGHT = 1;
    boolean [] inputs;

    public Controller() {
      inputs = new boolean[2];//2 valid buttons
    }

    boolean isPressed(int code) {
      return inputs[code];
    }

    void press(int code) {
      println(code);
      if(code == 'A')
        inputs[P1_LEFT] = true;
      if(code == 'D')
        inputs[P1_RIGHT] = true;
    }
    void release(int code) {
      if(code == 'A')
        inputs[P1_LEFT] = false;
      if(code == 'D')
        inputs[P1_RIGHT] = false;
    }
  }
