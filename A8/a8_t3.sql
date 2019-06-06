/*
    Ceate the proper constraints/assertions/triggers for the following:
    1. For every exhibition end date (if set) must be after its start date. 
        Same holds for artists’ death and birth dates.
    2. Adding an unavailable artifact to an exhibition is not allowed if the dates of the two exhibitions overlap.
        Hint: use a trigger, the easiest way to prevent the insertion is to set a NOT NULL attribute to NULL, 
        and let the primary key constraint cancel the insertion of the artifact.
    3. When a collection is deleted, all its artifacts should be automatically moved to the special collections 
        with title ”General paintings” and ”General sculptures”, according to their type.
    4. The museum keeps track of the total advertizing cost every artifact has received, 
        i.e., the total amount of money spend to advertize the exhibitions it has appeared over the years. 
        The information is stored inside table AdPerArtifact(id, cost); 
        assume that the table already contains an entry for every artifact, even with 0 cost.
    5. The museum has a fixed budget of 5000 Euros per month for advertizing on the web. 
        After exceeding this budget for current month no new ad can be posted.
        int: one way to keep only the month from a date is using the EXTRACT function.
*/