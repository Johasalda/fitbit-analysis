
head(dailyActivity_merged)

str(dailyActivity_merged)

summary(dailyActivity_merged)

sapply(dailyActivity_merged, function(x) sum(is.na(x)))

dailyActivity_merged <- dailyActivity_merged %>% distinct()

promedios <- dailyActivity_merged %>%
   summarise ( avg_steps = mean(TotalSteps, na.rm = TRUE),
               avg_distance = mean(TotalDistance, na.rm = TRUE),
               avg_calories = mean(Calories, na.rm = TRUE),
               avg_very_active_minutes = mean(VeryActiveMinutes, na.rm = TRUE),
               avg_light_active_minutes = mean(LightlyActiveMinutes, na.rm = TRUE),
               avg_sedentary_minutes = mean(SedentaryMinutes, na.rm = TRUE))

print(promedios)

dailyActivity_merged$activity_level <- cut(
  dailyActivity_merged$TotalSteps,
  breaks = c(-Inf, 5000, 7500, 10000, Inf),
  labels = c("sedentary", "Slightly Active", "Moderately Active", "Very active")
)

segment_summary <- dailyActivity_merged %>%
  group_by(activity_level) %>%
  summarise (avg_steps = mean(TotalSteps, na.rm = TRUE), 
             avg_distance = mean(TotalDistance, na.rm = TRUE),
             avg_calories = mean(Calories, na.rm = TRUE),
             avg_very_active_minutes = mean(VeryActiveMinutes, na.rm = TRUE),
             avg_light_active_minutes = mean(LightlyActiveMinutes, na.rm = TRUE),
             avg_sedentary_minutes = mean(SedentaryMinutes, na.rm = TRUE))

print(segment_summary)

dailyActivity_merged <- dailyActivity_merged %>%
  mutate(activity_level = case_when(
    SedentaryMinutes >= 480 ~ "Sedentario",
    TRUE ~ "Activo"
  ))

table(dailyActivity_merged$activity_level)


dailyActivity_merged %>%
  group_by(activity_level) %>%
  summarise(count = n()) %>%
  ggplot(aes(x = activity_level, y = count, fill = activity_level)) +
  geom_bar(stat = "identity") +
  labs(title = "Distribución de Usuarios por Nivel de Actividad",
       x = "Nivel de Actividad",
       y = "Número de Usuarios") +
  theme_minimal()


ggplot(dailyActivity_merged, aes(x = activity_level, y = SedentaryMinutes, fill = activity_level)) +
  geom_boxplot() +
  labs(title = "Comparación de Minutos Sedentarios por Nivel de Actividad",
       x = "Nivel de Actividad",
       y = "Minutos Sedentarios") +
  theme_minimal()


ggplot(dailyActivity_merged, aes(x = SedentaryMinutes, fill = activity_level)) +
  geom_histogram (binwidth = 30, alpha = 0.7, position = 'identity') +
  labs(title = "Distribución de Minutos Sedentarios",
       x = "Minutos Sedentarios",
       y = "Frecuencia") +
  theme_minimal()
