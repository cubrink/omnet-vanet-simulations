//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
//

package vanet_project.simulations.tictoc4;

simple Txc10
{
    parameters:
        @display("i=block/routing");
    gates:
        input in[];
        output out[];
}



network Tictoc10
{
    submodules:
        tic[6]: Txc10;
    connections:
        // Define topology
        for i=0..6 {
            tic[i%6].out++ --> {  delay = 100ms; } --> tic[(i+1)%6].in++;
        }
        tic[2].out++ --> {  delay = 100ms; } --> tic[4].in++;
        tic[3].out++ --> {  delay = 100ms; } --> tic[1].in++;
        tic[5].out++ --> {  delay = 100ms; } --> tic[2].in++;
                

}



