module main;

import dsfml.graphics;
import dlangui.platforms.dsfml.dsfmlapp : DSFMLWindow, DSFMLPlatform, initDSFMLApp, dsfmlPlatform, uninitDSFMLApp;
import myui;

void main(string[] args)
{

    initDSFMLApp();

    auto window = new RenderWindow(VideoMode(800, 600, 32), "Hello DSFML!", Window.Style.Titlebar | Window.Style.Close | Window.Style.Resize);
    window.setFramerateLimit(60);

    DSFMLWindow w = dsfmlPlatform.registerWindow(window);
    // create some widget to show in window
    w.mainWidget = createMainWidget();

    
    auto head = new CircleShape(100);
    head.fillColor = Color.Green;
    head.position = Vector2f(300,100);
    
    auto leftEye = new CircleShape(10);
    leftEye.fillColor = Color.Blue;
    leftEye.position = Vector2f(350,150);
    
    auto rightEye = new CircleShape(10);
    rightEye.fillColor = Color.Blue;
    rightEye.position = Vector2f(430,150);
    
    auto smile = new CircleShape(30);
    smile.fillColor = Color.Red;
    smile.position = Vector2f(368,200);
    
    auto smileCover = new RectangleShape(Vector2f(60,30));
    smileCover.fillColor = Color.Green;
    smileCover.position = Vector2f(368,200);
    
    while (window.isOpen())
    {
        Event event;
        
        while(window.pollEvent(event))
        {
            if(event.type == event.EventType.Closed)
            {
                window.close();
            }
        }
        if (!window.isOpen())
            break;
        
        window.clear();
        
        window.draw(head);
        window.draw(leftEye);
        window.draw(rightEye);
        window.draw(smile);
        window.draw(smileCover);
        
        w.draw();

        window.display();
    }

    //destroy(w);
    uninitDSFMLApp();
}
