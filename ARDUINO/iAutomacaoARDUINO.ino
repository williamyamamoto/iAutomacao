// A simple web server that always just says "Hello World"

#include "etherShield.h"
#include "ETHER_28J60.h"

int outputPin = 6;

int relay[] = {4, 5};

static uint8_t mac[6] = {0x54, 0x55, 0x58, 0x10, 0x00, 0x24};   // this just needs to be unique for your network, 
                                                                // so unless you have more than one of these boards
                                                                // connected, you should be fine with this value.
                                                           
static uint8_t ip[4] = {192, 168, 0, 253};                       // the IP address for your board. Check your home hub
                                                                // to find an IP address not in use and pick that
                                                                // this or 10.0.0.15 are likely formats for an address
                                                                // that will work.

static uint16_t port = 80;                                      // Use port 80 - the standard for HTTP

ETHER_28J60 e;

void setup()
{
 
  Serial.begin(9600);
 
  e.setup(mac, ip, port);
  pinMode(outputPin, OUTPUT);

  pinMode(4, OUTPUT);    // REQUIRED for eKitsZone.com ENC28J60 shield!!!
  digitalWrite(4, LOW); // Same as above.
  pinMode(5, OUTPUT);    // REQUIRED for eKitsZone.com ENC28J60 shield!!!
  digitalWrite(5, LOW); // Same as above.
  
  pinMode(relay[4], OUTPUT);
  pinMode(relay[5], OUTPUT);

}

void loop()
{
  

  char* params;
  if (params = e.serviceRequest())
  {
    e.print("<H1>Web Remote</H1>");
    if (strcmp(params, "?cmd1=on") == 0)
    {
      digitalWrite(4, HIGH); // Same as above.
      e.print("<A HREF='?cmd1=off'>Turn off</A>");

      Serial.println("Lâmpada Ligada!");
    }
    else if (strcmp(params, "?cmd1=off") == 0) // Modified -- 2011 12 15 # Ben Schueler
    {
      digitalWrite(4, LOW); // Same as above.
      e.print("<A HREF='?cmd1=on'>Turn on</A>");

      Serial.println("Lâmpada Desligada!");
    }
    if (strcmp(params, "?cmd2=on") == 0)
    {
      digitalWrite(5, HIGH); // Same as above.
      e.print("<A HREF='?cmd2=off'>Turn off</A>");
    
      Serial.println("Ar condicionado Ligado!");
}
    else if (strcmp(params, "?cmd2=off") == 0) // Modified -- 2011 12 15 # Ben Schueler
    {
      digitalWrite(5, LOW); // Same as above.
      e.print("<A HREF='?cmd2=on'>Turn on</A>");
    
      Serial.println("Ar condicionado Desligado!");
    }
    e.respond();
  }
}

