function a = psofn(c1,c2,w,p,q,r)

max_iter = 50;               % maximum iterations
N = 25;                      % number of particles
pi_b= zeros(25,3);           % it is the particle best reached solution
vi = zeros(25,3);            % intitialize velocity
a = zeros(25,3);             % initialize position
g_b = [p q r];               % [x y z] co-ordinates of final position
pf = [0 0 0];          
h=1;

%--------initialize the starting position of all the points(Square)----%

for m=1:5
    for n=1:5
        a(h,1)=m;
        a(h,2)=n;
        a(h,3)=0;
        h=h+1;
    end
end

%----------Record and save the plot-------------%
   %writerObj = VideoWriter('pso.avi');
   %open(writerObj);

for k = 1 : max_iter      
  for i = 1 : N
     
      dc= norm ( g_b- a(i,:));
      
   %-----If the difference is greater than 0.001 move on, else stop-----%
if(dc > 0.001)          
    
   %------------fitness-------------% 
   d_pib = norm ( g_b - pi_b(i,:));   
   d_pf = norm ( g_b - pf);        
   d_a = norm ( g_b- a(i,:));
   
   %--------------conditions----------%
  if(d_a < d_pib)
      pi_b(i,:) = a(i,:);
  end
   d_a = norm ( g_b- a(i,:));
   
  if(d_a < d_pf)
      pf = a(i,:);
  end
    
  
   vi(i,:) = w .* vi(i,:) + c1 * rand * (pi_b(i,:) - a(i,:)) + c2 * rand * (g_b - a(i,:));
   a(i,:) = a(i,:) + vi(i,:);
   
%------------------Plot----------------------------%

   scatter3(a(:,1) , a(:,2) , a(:,3), 100 , 'b' , '*');
   whitebg([1 1 1])
   title('Particle Swarm Optimization');
   xlabel('X-axis');
   ylabel('Y-axis');
   zlabel('Z-axis');
   axis([-2*p 2*p -2*q 2*q -2*r 2*r]);          
   M(i) = getframe;                    
end
  display(a)
  end
end
  %close(writerObj);
