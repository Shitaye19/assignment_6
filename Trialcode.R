

View(toy1)
View(toy2)


toy1 %>% 
  left_join(toy2, by = "animal", "key" = "label") %>% 
  kable()



toy2 %>% 
  rename("key" = "label")

toy1 %>% 
  left_join(toy2, c("key" = "label"))%>% 
  kable()

Joined_banking<- banking_account_types %>% 
  left_join(banking_transactions, c("account_id" = "id"))%>% 
  group_by(account_type) %>% 
  summarise(total_transaction_ammount = sum(transaction_amount)) %>% 
  ggplot(mapping = aes(x = account_type, y = total_transaction_ammount)) +
  geom_boxplot()
 # geom_jitter(position = position_jitter(0.2))
  
  
Joined_banking


  banking_account_types %>% 
  left_join(banking_transactions, c("account_id" = "id")) %>% 
  group_by(account_type, account_id) %>% 
  summarise(total_transaction_ammount = sum(transaction_amount)) %>% 
  ggplot(mapping = aes(x = account_type, y = total_transaction_ammount)) +
  geom_boxplot(outlier.shape = NA)+
  geom_jitter(height = 0) #position = position_jitter(0.4))  


titanic_person_features2 <- titanic_person_features %>% 
  select(PID, PClass) 
View(titanic_person_features2)

titanic_person_features2 %>% 
  left_join(titanic_outcomes, by = "PID") %>% 
  group_by(PClass) %>% 
  ggplot()+ #mapping = aes(x = PClass)) +
  geom_bar(aes(x = PClass, fill = Survived))#, stat = "identity"))

joined_titanic<-titanic_person_features2 %>% 
  left_join(titanic_outcomes, by = "PID") 


rownames_to_column(mtcars) %>% 
  arrange(mpg) %>% 
  mutate(mpg_order = row_number(mpg)) %>% 
  kable(head())


mtcars1<-rownames_to_column(mtcars) 
 # arrange(mpg)
dim(mtcars)


mtcars1<-rownames_to_column(mtcars) 
mtcars2<-mtcars1 %>% 
  mutate(mpg_order = row_number(mtcars1$mpg)) %>% 
  select(mpg, mpg_order, cyl, hp) 
kable(head(mtcars2))


ggplot(mtcars2)+
  geom_label(mapping = aes(x = mpg, y = mpg_order, label = rowname, color = cyl, size = hp))+
  theme_bw() +
  xlim(10, 40)+
  labs(x = "Miles per gallon fuel consumption")
 

ggplot(mtcars2, aes(x = mpg, y = mpg_order))+
  geom_text(mapping = aes(label = rowname),color = cyl, size = hp) +
  #geom_label(mapping = aes(x = mpg, y = mpg_order, label = rowname, color = cyl, size = hp))+
  theme_bw() +
  xlim(10, 40)+
  labs(x = "Miles per gallon fuel consumption")

  
  
  
  ggplot(mtcars2, aes(x = mpg, y = mpg_order))+
    geom_text(mapping = aes(label = rowname), color = cyl, size = hp)+
  #geom_label(mapping = aes(x = mpg, y = mpg_order, label = rowname, color = cyl, size = hp))+
  theme_bw() +
    xlim(10, 40)+
    labs(x = "Miles per gallon fuel consumption")
  
  ###
  ggplot(mtcars2, aes(x = mpg, y = mpg_order, color = cyl, size = hp ))+
    geom_text(mapping = aes(label = rowname))+
    #geom_label(mapping = aes(x = mpg, y = mpg_order, label = rowname, color = cyl, size = hp))+
    theme_bw() +
    xlim(10, 40)+
    labs(x = "Miles per gallon fuel consumption")
  
  
  ggplot( mtcars2 ,aes(x = mpg, y = mpg_order))+
    
    geom_point(mapping = aes(size = hp, color = cyl, label = rowname))+
    
    #geom_label(mapping = aes(x = mpg, y = mpg_order, label = rowname, 
                             #color = cyl, size = hp))+
    theme_bw() +
    xlim(10, 40)+
    labs(x = "Miles per gallon fuel consumption",
         y = "")
#@####
    
 ggplot(mtcars2, mapping = aes(x =mpg, y = mpg_order)) +
   geom_point(mapping = aes(label = rownames,size = hp, color =cyl)) +
  xlim(10, 40)+
  labs(x = "Miles per gallon fuel consumption",
       y = "") +
     theme_bw() 
   
  
  
###
 
 ggplot( mtcars2 ,aes(x = mpg, y = mpg_order, color = cyl))+
   
   geom_point(mapping = aes(size = hp))+
   
   #geom_label(mapping = aes(label = rowname)) +
   
   theme_bw() +
   xlim(10, 40)+
   labs(x = "Miles per gallon fuel consumption"+
     y = theme())
  
  
  
 ggplot(mtcars2) +
 #geom_point(aes(x = mpg, y = mpg_order)) +
   #geom_point(aes(x = mpg, y = mpg_order))+
   geom_label(mapping= aes(x = mpg, y = mpg_order, label = rowname))+
theme_bw()
  

###
 ggplot(mtcars2, aes(x = mpg, y = mpg_order, label = rowname, size = hp))+#, color = cyl)+
   
   geom_point(aes(color = cyl)) + geom_text(aes(label = rowname), hjust =0)+
   xlim(10, 40)+
   labs(x = "Miles per gallon fuel consumption",
        y = "")
 
   #geom_point(aes(x = mpg, y = mpg_order)) +
   #geom_point(aes(x = mpg, y = mpg_order))+
   #geom_label(mapping= aes(x = mpg, y = mpg_order, label = rowname))+

 

 
 
 
 
 
 
 
 
 







