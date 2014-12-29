close all
imtool close all

fileID = fopen('plates.txt');
nplates = fscanf(fileID,'%d %d',2);

j=0;
J=[];
while ~feof(fileID)
    
   name=strcat('C:\Users\kurt\_CODES\_opencv\video_to_frame\',num2str(j),'.png');
   %[min_row, max_row, min_col, max_col]=suryanarayana(name)
    
   numplates = nplates(2);
   for i=1:nplates(2)
       location = transpose(fscanf(fileID,'%d %d %d %d',4));
   end
   nplates = fscanf(fileID,'%d %d',2);
   if nplates(2) > 0
       %[min_row, max_row, min_col, max_col]=vlpl(name);
       [min_row, max_row, min_col, max_col]=suryanarayana(name);
       for i=1:length(min_row)
           algorithm=[min_col(i), min_row(i), max_col(i)-min_col(i), max_row(i)-min_row(i)];
           areaA=algorithm(3)*algorithm(4);
           areaB=location(3)*location(4);
           intersection=rectint(algorithm,location);
           union=areaA+areaB-intersection;
           J(end+1)=intersection/union;

       end
   else
       for i=1:length(min_row)
           J(end+1)=-1;
       end
   end
      
   J(end)
   
   pause(.001);
   j=j+1

end
