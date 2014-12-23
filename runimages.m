close all
imtool close all

fileID = fopen('plates.txt');
nplates = fscanf(fileID,'%d %d',2);

j=0;
while ~feof(fileID)
    
   name=strcat('bentoipiranga_1410/',num2str(j),'.png');
   %suryanarayana(name); 
   [min_row, max_row, min_col, max_col]=vlpl(name);
   algorithm=[min_col, min_row, max_col-min_col, max_row-min_row]
  
   numplates = nplates(2);
   for i=1:nplates(2)
       location = transpose(fscanf(fileID,'%d %d %d %d',4))
   end
   nplates = fscanf(fileID,'%d %d',2);
   areaA=algorithm(3)*algorithm(4);
   areaB=location(3)*location(4);
   intersection=rectint(algorithm,location);
   union=areaA+areaB-intersection;
   J=intersection/union
   k=waitforbuttonpress();
   pause(.001);
   j=j+1;

end
