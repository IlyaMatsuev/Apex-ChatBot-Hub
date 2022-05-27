/**
 * Created by Ilya Matsuev on 8/25/2020.
 */

public with sharing class JSONReplacer {
    public static final String DOUBLE_QUOTES = '"';

    private String json { get; set; }

    public JSONReplacer(String json) {
        this.json = json;
    }

    public String replace(Map<String, String> replaceMap) {
        for (String replaceField : replaceMap.keySet()) {
            json = json.replace(
                DOUBLE_QUOTES +
                replaceField +
                DOUBLE_QUOTES,
                DOUBLE_QUOTES +
                replaceMap.get(replaceField) +
                DOUBLE_QUOTES
            );
        }
        return json;
    }
}
